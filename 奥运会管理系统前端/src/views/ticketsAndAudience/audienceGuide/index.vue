<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="赛事ID" prop="eventId">
        <el-select v-model="queryParams.eventId" placeholder="请选择赛事ID" clearable style="width: 200px">
          <el-option
              v-for="dict in saixian"
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
            v-hasPermi="['audience:guide:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="success"
            plain
            icon="Edit"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['audience:guide:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="danger"
            plain
            icon="Delete"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['audience:guide:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
            type="warning"
            plain
            icon="Download"
            @click="handleExport"
            v-hasPermi="['audience:guide:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="guideList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="赛事ID" align="center" prop="eventId">
        <template #default="scope">
          <dict-tag :options="saixian" :value="scope.row.eventId"/>
        </template>
      </el-table-column>
      <el-table-column label="场馆地图" align="center" prop="venueMap" />
      <el-table-column label="交通指南" align="center" prop="transportationGuide" />
      <el-table-column label="安全须知" align="center" prop="safetyNotice" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['audience:guide:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['audience:guide:remove']">删除</el-button>
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

    <!-- 添加或修改观众指南对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="guideRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="赛事ID" prop="eventId">
          <el-select v-model="form.eventId" placeholder="请选择赛事ID" style="width: 200px">
            <el-option
                v-for="dict in saixian"
                :key="dict.value"
                :label="dict.label"
                :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="场馆地图" prop="venueMap">
          <el-input v-model="form.venueMap" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="交通指南" prop="transportationGuide">
          <el-input v-model="form.transportationGuide" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="安全须知" prop="safetyNotice">
          <el-input v-model="form.safetyNotice" type="textarea" placeholder="请输入内容" />
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

<script setup name="Guide">
import {listGuide, getGuide, delGuide, addGuide, updateGuide} from "@/api/audience/guide";

const {proxy} = getCurrentInstance();
const {saixian} = proxy.useDict('saixian');

const guideList = ref([]);
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
    eventId: null,
    venueMap: null,
    transportationGuide: null,
    safetyNotice: null
  },
  rules: {}
});

const {queryParams, form, rules} = toRefs(data);

/** 查询观众指南列表 */
function getList() {
  loading.value = true;
  listGuide(queryParams.value).then(response => {
    guideList.value = response.rows;
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
    eventId: null,
    venueMap: null,
    transportationGuide: null,
    safetyNotice: null
  };
  proxy.resetForm("guideRef");
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
  title.value = "添加观众指南";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getGuide(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改观众指南";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["guideRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateGuide(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addGuide(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除观众指南编号为"' + _ids + '"的数据项？').then(function () {
    return delGuide(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {
  });
}


/** 导出按钮操作 */
function handleExport() {
  proxy.download('audience/guide/export', {
    ...queryParams.value
  }, `guide_${new Date().getTime()}.xlsx`)
}

getList();
</script>
