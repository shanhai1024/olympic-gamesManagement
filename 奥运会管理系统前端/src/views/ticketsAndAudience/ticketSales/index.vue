<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="赛事" prop="eventId">
          <el-select v-model="queryParams.eventId" style="width: 200px" prop="eventId">
              <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
          </el-select>
      </el-form-item>
      <el-form-item label="票种类别" prop="ticketCategory">
          <el-select v-model="queryParams.ticketCategory" style="width: 200px" prop="ticketCategory">
              
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
<!--      <el-form-item label="总票量" prop="totalQuantity">-->
<!--        <el-input-->
<!--          v-model="queryParams.totalQuantity"-->
<!--          placeholder="请输入总票量"-->
<!--          clearable-->
<!--          @keyup.enter="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="已售票量" prop="soldQuantity">-->
<!--        <el-input-->
<!--          v-model="queryParams.soldQuantity"-->
<!--          placeholder="请输入已售票量"-->
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
          v-hasPermi="['ticketsAndAudience:ticketSales:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ticketsAndAudience:ticketSales:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ticketsAndAudience:ticketSales:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['ticketsAndAudience:ticketSales:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ticketSalesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="赛事名" align="center" prop="eventId" :formatter="handleEvent"  />
        <el-table-column label="票种类别" align="center" prop="ticketCategory">
            <template #default="scope">
                <dict-tag :options="ticket_type" :value="scope.row.ticketCategory" />
            </template>
        </el-table-column>
      <el-table-column label="票价" align="center" prop="ticketPrice" />
      <el-table-column label="总票量" align="center" prop="totalQuantity" />
      <el-table-column label="已售票量" align="center" prop="soldQuantity" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['ticketsAndAudience:ticketSales:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['ticketsAndAudience:ticketSales:remove']">删除</el-button>
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

    <!-- 添加或修改门票与观众服务-门票销售对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="ticketSalesRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="赛事" prop="eventId">
            <el-select v-model="form.eventId" style="width: 200px" prop="eventId">
                <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="票种类别" prop="ticketCategory">
            <el-select v-model="form.ticketCategory" style="width: 200px" prop="ticketCategory">
                <el-option v-for="item in ticket_type" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="票价" prop="ticketPrice">
          <el-input v-model.number="form.ticketPrice" placeholder="请输入票价" />
        </el-form-item>
        <el-form-item label="总票量" prop="totalQuantity">
          <el-input v-model.number="form.totalQuantity" placeholder="请输入总票量" />
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

<script setup name="TicketSales">
import { listTicketSales, getTicketSales, delTicketSales, addTicketSales, updateTicketSales } from "@/api/ticketsAndAudience/ticketSales";
import DictTag from "@/components/DictTag/index.vue";

const { proxy } = getCurrentInstance();

const ticketSalesList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const { ticket_type } = proxy.useDict("ticket_type")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    eventId: null,
    ticketCategory: null,
    ticketPrice: null,
    totalQuantity: null,
    soldQuantity: null
  },
  rules: {
      ticketPrice:[{type: 'number',message:'票价必须为数字',trigger: 'change'}],
      totalQuantity:[{type: 'number',message:'总票量必须为数字',trigger: 'change'}]
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
/** 查询门票与观众服务-门票销售列表 */
function getList() {
  loading.value = true;
  listTicketSales(queryParams.value).then(response => {
    ticketSalesList.value = response.rows;
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
    ticketCategory: null,
    ticketPrice: null,
    totalQuantity: null,
    soldQuantity: null
  };
  proxy.resetForm("ticketSalesRef");
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
  title.value = "添加门票与观众服务-门票销售";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getTicketSales(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改门票与观众服务-门票销售";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["ticketSalesRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateTicketSales(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTicketSales(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除门票与观众服务-门票销售编号为"' + _ids + '"的数据项？').then(function() {
    return delTicketSales(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('ticketsAndAudience/ticketSales/export', {
    ...queryParams.value
  }, `ticketSales_${new Date().getTime()}.xlsx`)
}

getList();
</script>
