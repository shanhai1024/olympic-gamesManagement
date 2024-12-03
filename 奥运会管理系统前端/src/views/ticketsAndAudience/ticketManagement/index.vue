<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="赛事" prop="eventId">
          <el-select v-model="queryParams.eventId" style="width: 200px" prop="eventId">
              <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
          </el-select>
      </el-form-item>
<!--      <el-form-item label="票价" prop="ticketPrice">-->
<!--        <el-input-->
<!--          v-model="queryParams.ticketPrice"-->
<!--          placeholder="请输入票价"-->
<!--          clearable-->
<!--          @keyup.enter="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="票量" prop="ticketQuantity">-->
<!--        <el-input-->
<!--          v-model="queryParams.ticketQuantity"-->
<!--          placeholder="请输入票量"-->
<!--          clearable-->
<!--          @keyup.enter="handleQuery"-->
<!--        />-->
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
          v-hasPermi="['ticketsAndAudience:ticketManagement:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ticketsAndAudience:ticketManagement:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ticketsAndAudience:ticketManagement:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['ticketsAndAudience:ticketManagement:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ticketManagementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="赛事名" align="center" prop="eventId" :formatter="handleEvent" />
      <el-table-column label="票价" align="center" prop="ticketPrice" />
      <el-table-column label="票量" align="center" prop="ticketQuantity" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['ticketsAndAudience:ticketManagement:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['ticketsAndAudience:ticketManagement:remove']">删除</el-button>
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

    <!-- 添加或修改门票与观众服务-门票管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="ticketManagementRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="赛事" prop="eventId">
            <el-select v-model="form.eventId" style="width: 200px" prop="eventId">
                <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="票价" prop="ticketPrice">
          <el-input v-model.number="form.ticketPrice" placeholder="请输入票价" />
        </el-form-item>
        <el-form-item label="票量" prop="ticketQuantity">
          <el-input v-model.number="form.ticketQuantity" placeholder="请输入票量" />
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

<script setup name="TicketManagement">
import { listTicketManagement, getTicketManagement, delTicketManagement, addTicketManagement, updateTicketManagement } from "@/api/ticketsAndAudience/ticketManagement";

const { proxy } = getCurrentInstance();

const ticketManagementList = ref([]);
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
    ticketPrice: null,
    ticketQuantity: null
  },
  rules: {
      ticketPrice: [{type: 'number', message: '票价必须为数字',trigger: 'change'}],
      ticketQuantity: [{type: 'number', message: '票量必须为数字',trigger: 'change'}]
  }
});
const eventNameList = ref(null)

proxy.getQuerySelect("query_eventName").then(res=>{
    eventNameList.value = res.data
})

const { queryParams, form, rules } = toRefs(data);

function handleEvent(row){
    for (let valueElement of eventNameList.value) {
        if(valueElement.value==row.eventId){
            return valueElement.label
        }
    }
    return ""
}
/** 查询门票与观众服务-门票管理列表 */
function getList() {
  loading.value = true;
  listTicketManagement(queryParams.value).then(response => {
    
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
    ticketPrice: null,
    ticketQuantity: null
  };
  proxy.resetForm("ticketManagementRef");
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
  title.value = "添加门票与观众服务-门票管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getTicketManagement(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改门票与观众服务-门票管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["ticketManagementRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateTicketManagement(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTicketManagement(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除门票与观众服务-门票管理编号为"' + _ids + '"的数据项？').then(function() {
    return delTicketManagement(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('ticketsAndAudience/ticketManagement/export', {
    ...queryParams.value
  }, `ticketManagement_${new Date().getTime()}.xlsx`)
}

getList();
</script>
