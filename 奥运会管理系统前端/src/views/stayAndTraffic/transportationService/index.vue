<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="车辆类型" prop="vehicleType">
        <el-select v-model="queryParams.vehicleType" clearable style="width: 200px">
            <el-option v-for="item in transportation_type" :key="item.value" :value="item.value" :label="item.label" />
        </el-select>
      </el-form-item>
        <el-form-item label="服务类型" prop="serviceType">
            <el-select v-model="queryParams.serviceType"
                       placeholder="请选择服务类型"
                       style="width: 200px"
            >
                <el-option v-for="item in traffic_service_type" :key="item.value"
                           :label="item.label" :value="item.value"
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
          v-hasPermi="['stayAndTraffic:transportationService:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['stayAndTraffic:transportationService:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['stayAndTraffic:transportationService:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['stayAndTraffic:transportationService:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="transportationServiceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
        <el-table-column label="服务类型" align="center" prop="serviceType">
            <template #default="scope">
                <dict-tag :options="traffic_service_type" :value="scope.row.serviceType" />
            </template>
        </el-table-column>
        <el-table-column label="车辆类型" align="center" prop="vehicleType">
            <template #default="scope">
                <dict-tag :options="transportation_type" :value="scope.row.vehicleType" />
            </template>
        </el-table-column>
      <el-table-column label="容量" align="center" prop="capacity" />
      <el-table-column label="调度详情" align="center" prop="scheduleDetails" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['stayAndTraffic:transportationService:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['stayAndTraffic:transportationService:remove']">删除</el-button>
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

    <!-- 添加或修改住宿与交通调度-交通服务对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="transportationServiceRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="服务类型" prop="serviceType">
          <el-select v-model="form.serviceType"
            placeholder="请选择服务类型"
             style="width: 200px"
          >
            <el-option v-for="item in traffic_service_type" :key="item.value"
              :label="item.label" :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="车辆类型" prop="vehicleType">
          <el-select v-model="form.vehicleType"
            placeholder="请选择车辆类型"
             style="width: 200px"
          >
            <el-option v-for="item in transportation_type" :key="item.value"
              :label="item.label" :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="容量" prop="capacity">
          <el-input v-model="form.capacity" placeholder="请输入容量" />
        </el-form-item>
        <el-form-item label="调度详情" prop="scheduleDetails">
          <el-input v-model="form.scheduleDetails" type="textarea" placeholder="请输入内容" />
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

<script setup name="TransportationService">
import { listTransportationService, getTransportationService, delTransportationService, addTransportationService, updateTransportationService } from "@/api/stayAndTraffic/transportationService";
import DictTag from "@/components/DictTag/index.vue";

const { proxy } = getCurrentInstance();

const transportationServiceList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const { transportation_type } = proxy.useDict("transportation_type")
const { traffic_service_type } = proxy.useDict("traffic_service_type")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    serviceType: null,
    vehicleType: null,
    capacity: null,
    scheduleDetails: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询住宿与交通调度-交通服务列表 */
function getList() {
  loading.value = true;
  listTransportationService(queryParams.value).then(response => {
    transportationServiceList.value = response.rows;
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
    serviceType: null,
    vehicleType: null,
    capacity: null,
    scheduleDetails: null
  };
  proxy.resetForm("transportationServiceRef");
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
  title.value = "添加住宿与交通调度-交通服务";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getTransportationService(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改住宿与交通调度-交通服务";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["transportationServiceRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateTransportationService(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTransportationService(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除住宿与交通调度-交通服务编号为"' + _ids + '"的数据项？').then(function() {
    return delTransportationService(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('stayAndTraffic/transportationService/export', {
    ...queryParams.value
  }, `transportationService_${new Date().getTime()}.xlsx`)
}

getList();
</script>
