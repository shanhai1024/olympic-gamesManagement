<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="人员类型" prop="personType">
        <el-select v-model="queryParams.personType" placeholder="请选择人员类型" clearable style="width: 200px">
          <el-option
              v-for="dict in person_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
            type="primary"
            plain
            icon="Plus"
            @click="handleAdd"
            v-hasPermi="['health:monitoring:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="Edit"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['health:monitoring:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['health:monitoring:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['health:monitoring:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="monitoringList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="人员类型" align="center" prop="personType">
        <template #default="scope">
          <dict-tag :options="person_type" :value="scope.row.personType"/>
        </template>
      </el-table-column>
      <el-table-column label="健康监测详情" align="center" prop="monitoringDetails" />
      <el-table-column label="医疗支持信息" align="center" prop="medicalSupportInfo" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['health:monitoring:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['health:monitoring:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
    />

    <!-- 添加或修改健康监测对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="monitoringRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="人员类型" prop="personType">
          <el-select v-model="form.personType" placeholder="请选择人员类型" style="width: 200px">
            <el-option
                v-for="dict in person_type"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="健康监测详情" prop="monitoringDetails">
          <el-input v-model="form.monitoringDetails" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="医疗支持信息" prop="medicalSupportInfo">
          <el-input v-model="form.medicalSupportInfo" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Monitoring">
import { listMonitoring, getMonitoring, delMonitoring, addMonitoring, updateMonitoring } from "@/api/health/monitoring";

const { proxy } = getCurrentInstance();
const { person_type } = proxy.useDict('person_type');

const monitoringList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    personType: null,
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询健康监测列表 */
function getList() {
  loading.value = true;
  listMonitoring(queryParams.value).then(response => {
    monitoringList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null,
    personType: null,
    monitoringDetails: null,
    medicalSupportInfo: null
  };
  proxy.resetForm("monitoringRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加健康监测";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getMonitoring(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改健康监测";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["monitoringRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateMonitoring(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addMonitoring(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除健康监测编号为"' + _ids + '"的数据项？').then(function() {
    return delMonitoring(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('health/monitoring/export', {
    ...queryParams.value
  }, `monitoring_${new Date().getTime()}.xlsx`)
}

getList();
</script>
