<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="新闻标题" prop="newsTitle">
        <el-input
          v-model="queryParams.newsTitle"
          placeholder="请输入新闻标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="发布日期" prop="publishDate">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.publishDate"-->
<!--          type="date"-->
<!--          value-format="YYYY-MM-DD"-->
<!--          placeholder="请选择发布日期">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
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
          v-hasPermi="['mediaAndPublic:pressRelease:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['mediaAndPublic:pressRelease:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['mediaAndPublic:pressRelease:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['mediaAndPublic:pressRelease:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pressReleaseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="新闻标题" align="center" prop="newsTitle" />
      <el-table-column label="新闻内容" align="center" prop="newsContent" />
      <el-table-column label="发布日期" align="center" prop="publishDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.publishDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['mediaAndPublic:pressRelease:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete"  v-hasPermi="['mediaAndPublic:pressRelease:remove']">删除</el-button>
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

    <!-- 添加或修改媒体与公关-新闻发布对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="pressReleaseRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="新闻标题" prop="newsTitle">
          <el-input v-model="form.newsTitle" placeholder="请输入新闻标题" />
        </el-form-item>
        <el-form-item label="新闻内容">
            <el-input v-model="form.newsContent" type="textarea" placeholder="请输入新闻标题" />
<!--          <editor v-model="form.newsContent" :min-height="192"/>-->
        </el-form-item>
        <el-form-item label="发布日期" prop="publishDate">
          <el-date-picker clearable
            v-model="form.publishDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择发布日期">
          </el-date-picker>
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

<script setup name="PressRelease">
import { listPressRelease, getPressRelease, delPressRelease, addPressRelease, updatePressRelease } from "@/api/mediaAndPublic/pressRelease";

const { proxy } = getCurrentInstance();

const pressReleaseList = ref([]);
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
    newsTitle: null,
    newsContent: null,
    publishDate: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询媒体与公关-新闻发布列表 */
function getList() {
  loading.value = true;
  listPressRelease(queryParams.value).then(response => {
    pressReleaseList.value = response.rows;
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
    newsTitle: null,
    newsContent: null,
    publishDate: null
  };
  proxy.resetForm("pressReleaseRef");
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
  title.value = "添加媒体与公关-新闻发布";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getPressRelease(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改媒体与公关-新闻发布";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["pressReleaseRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updatePressRelease(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPressRelease(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除媒体与公关-新闻发布编号为"' + _ids + '"的数据项？').then(function() {
    return delPressRelease(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('mediaAndPublic/pressRelease/export', {
    ...queryParams.value
  }, `pressRelease_${new Date().getTime()}.xlsx`)
}

getList();
</script>
