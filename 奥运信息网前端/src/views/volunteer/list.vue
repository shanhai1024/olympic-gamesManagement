<template>
  <div class="app-container">



    <el-table v-loading="loading" :data="volunteerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="发布时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="信息标题" align="center" prop="title" />
      <el-table-column label="发布者" align="center" prop="createBy" />
      <el-table-column label="浏览量" align="center" prop="views" />
      <el-table-column label="信息简介" align="center" prop="content" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope" @click="gotoINfo()" >
          <el-button link type="primary" icon="Edit">查看</el-button>
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

    <!-- 添加或修改志愿者信息中心对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="volunteerRef" :model="form" :rules="rules" label-width="80px">
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

<script setup name="Volunteer">
import { listVolunteer, getVolunteer, delVolunteer, addVolunteer, updateVolunteer } from "@/api/sports/volunteer";
import router from "@/router";

const { proxy } = getCurrentInstance();

const volunteerList = ref([]);
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
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);


function gotoINfo(){
  this.router.push('/volunteer/detail');
}
/** 查询志愿者信息中心列表 */
function getList() {
  loading.value = true;
  listVolunteer(queryParams.value).then(response => {
    volunteerList.value = response.rows;
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
    title: null,
    content: null,
    views: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  };
  proxy.resetForm("volunteerRef");
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
  title.value = "添加志愿者信息中心";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getVolunteer(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改志愿者信息中心";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["volunteerRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateVolunteer(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addVolunteer(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除志愿者信息中心编号为"' + _ids + '"的数据项？').then(function() {
    return delVolunteer(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('sports/volunteer/export', {
    ...queryParams.value
  }, `volunteer_${new Date().getTime()}.xlsx`)
}

getList();
</script>
