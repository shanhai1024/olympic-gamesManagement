<template>
  <div class="app-container">
<!--    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="Refresh" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['volunteer:trainingManagement:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['volunteer:trainingManagement:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['volunteer:trainingManagement:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['volunteer:trainingManagement:export']"-->
<!--        >导出</el-button>-->
      </el-col>
<!--      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>-->
    </el-row>

    <el-table v-loading="loading" :data="trainingManagementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="备注" align="center" prop="remark" />
<!--      <el-table-column label="在线培训材料" align="center" prop="trainingMaterial">-->
<!--      </el-table-column>-->
      <el-table-column label="线下培训课程安排" align="center" prop="offlineTrainingSchedule" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['volunteer:trainingManagement:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['volunteer:trainingManagement:remove']">删除</el-button>
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

    <!-- 添加或修改志愿者管理-培训管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="trainingManagementRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="在线培训材料" prop="trainingMaterial" label-width="100px">
          <file-upload v-model="form.trainingMaterial" :limit="1" :file-size="100" :file-type="fileType" />
        </el-form-item>
        <el-form-item label="线下培训课程" prop="offlineTrainingSchedule" label-width="100px">
          <el-input v-model="form.offlineTrainingSchedule" type="textarea" placeholder="请输入内容" />
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

<script setup name="TrainingManagement">
import { listTrainingManagement, getTrainingManagement, delTrainingManagement, addTrainingManagement, updateTrainingManagement } from "@/api/volunteer/trainingManagement";
import FileUpload from "@/components/FileUpload/index.vue";

const { proxy } = getCurrentInstance();

const trainingManagementList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const fileType = ref(["doc","ppt","pdf"])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    trainingMaterial: null,
    offlineTrainingSchedule: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询志愿者管理-培训管理列表 */
function getList() {
  loading.value = true;
  listTrainingManagement(queryParams.value).then(response => {
    trainingManagementList.value = response.rows;
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
    trainingMaterial: null,
    offlineTrainingSchedule: null
  };
  proxy.resetForm("trainingManagementRef");
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
  title.value = "添加志愿者管理-培训管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getTrainingManagement(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改志愿者管理-培训管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["trainingManagementRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateTrainingManagement(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTrainingManagement(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除志愿者管理-培训管理编号为"' + _ids + '"的数据项？').then(function() {
    return delTrainingManagement(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('volunteer/trainingManagement/export', {
    ...queryParams.value
  }, `trainingManagement_${new Date().getTime()}.xlsx`)
}

getList();
</script>
