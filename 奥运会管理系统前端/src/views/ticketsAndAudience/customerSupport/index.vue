<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="客户姓名" prop="customerName">
        <el-input
          v-model="queryParams.customerName"
          placeholder="请输入客户姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系方式" prop="contactInfo">
        <el-input
          v-model="queryParams.contactInfo"
          placeholder="请输入联系方式"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
        <el-form-item label="处理状态" prop="status">
            <el-select v-model="queryParams.status" style="width: 200px">
                <el-option v-for="item in dis_status" :key="item.value" :value="item.value" :label="item.label" />
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
          v-hasPermi="['ticketsAndAudience:customerSupport:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ticketsAndAudience:customerSupport:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ticketsAndAudience:customerSupport:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['ticketsAndAudience:customerSupport:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="customerSupportList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="客户姓名" align="center" prop="customerName" />
      <el-table-column label="联系方式" align="center" prop="contactInfo" />
      <el-table-column label="咨询详情" align="center" prop="inquiryDetails" />
      <el-table-column label="处理状态" align="center" prop="status">
          <template #default="scope">
              <dict-tag :options="dis_status" :value="scope.row.status" />
          </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['ticketsAndAudience:customerSupport:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['ticketsAndAudience:customerSupport:remove']">删除</el-button>
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

    <!-- 添加或修改门票与观众服务-客服支持对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="customerSupportRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="客户姓名" prop="customerName">
          <el-input v-model="form.customerName" placeholder="请输入客户姓名" />
        </el-form-item>
        <el-form-item label="联系方式" prop="contactInfo">
          <el-input v-model="form.contactInfo" placeholder="请输入联系方式" />
        </el-form-item>
        <el-form-item label="咨询详情" prop="inquiryDetails">
          <el-input v-model="form.inquiryDetails" type="textarea" placeholder="请输入内容" />
        </el-form-item>
          <el-form-item label="处理状态" prop="status">
              <el-select v-model="form.status" style="width: 200px">
                  <el-option v-for="item in dis_status" :key="item.value" :value="item.value" :label="item.label" />
              </el-select>
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

<script setup name="CustomerSupport">
import { listCustomerSupport, getCustomerSupport, delCustomerSupport, addCustomerSupport, updateCustomerSupport } from "@/api/ticketsAndAudience/customerSupport";
import DictTag from "@/components/DictTag/index.vue";

const { proxy } = getCurrentInstance();

const customerSupportList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const { dis_status } = proxy.useDict("dis_status")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    customerName: null,
    contactInfo: null,
    inquiryDetails: null,
    status: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询门票与观众服务-客服支持列表 */
function getList() {
  loading.value = true;
  listCustomerSupport(queryParams.value).then(response => {
    customerSupportList.value = response.rows;
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
    customerName: null,
    contactInfo: null,
    inquiryDetails: null,
    status: null
  };
  proxy.resetForm("customerSupportRef");
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
  title.value = "添加门票与观众服务-客服支持";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getCustomerSupport(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改门票与观众服务-客服支持";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["customerSupportRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateCustomerSupport(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCustomerSupport(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除门票与观众服务-客服支持编号为"' + _ids + '"的数据项？').then(function() {
    return delCustomerSupport(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('ticketsAndAudience/customerSupport/export', {
    ...queryParams.value
  }, `customerSupport_${new Date().getTime()}.xlsx`)
}

getList();
</script>
