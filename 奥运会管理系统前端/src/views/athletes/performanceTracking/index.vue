<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="运动员" prop="athleteId">
          <el-select v-model="queryParams.athleteId" style="width: 200px" prop="athleteId">
              <el-option v-for="item in athelteNameList" :key="item.value" :value="item.value" :label="item.label" />
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
          v-hasPermi="['athletes:performanceTracking:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['athletes:performanceTracking:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['athletes:performanceTracking:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['athletes:performanceTracking:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="performanceTrackingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="运动员" align="center" prop="athleteId" :formatter="handleAthelte" />
      <el-table-column label="训练表现" align="center" prop="trainingPerformance" />
      <el-table-column label="比赛表现" align="center" prop="competitionPerformance" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['athletes:performanceTracking:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['athletes:performanceTracking:remove']">删除</el-button>
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

    <!-- 添加或修改运动员管理-现追踪对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="performanceTrackingRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="运动员" prop="athleteId">
            <el-select v-model="form.athleteId" style="width: 200px" prop="athleteId">
                <el-option v-for="item in athelteNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="训练表现" prop="trainingPerformance">
          <el-input v-model="form.trainingPerformance" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="比赛表现" prop="competitionPerformance">
          <el-input v-model="form.competitionPerformance" type="textarea" placeholder="请输入内容" />
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

<script setup name="PerformanceTracking">
import { listPerformanceTracking, getPerformanceTracking, delPerformanceTracking, addPerformanceTracking, updatePerformanceTracking } from "@/api/athletes/performanceTracking";

const { proxy } = getCurrentInstance();

const performanceTrackingList = ref([]);
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
    athleteId: null,
    trainingPerformance: null,
    competitionPerformance: null
  },
  rules: {
  }
});
const athelteNameList = ref(null)
proxy.getQuerySelect("query_athelteName").then(res=>{
    athelteNameList.value = res.data
})

const { queryParams, form, rules } = toRefs(data);
function handleAthelte(row){
    for (let valueElement of athelteNameList.value) {
        if(valueElement.value==row.athleteId){
            return valueElement.label
        }
    }
    return ""
}
/** 查询运动员管理-现追踪列表 */
function getList() {
  loading.value = true;
  listPerformanceTracking(queryParams.value).then(response => {
    performanceTrackingList.value = response.rows;
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
    athleteId: null,
    trainingPerformance: null,
    competitionPerformance: null
  };
  proxy.resetForm("performanceTrackingRef");
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
  title.value = "添加运动员管理-现追踪";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getPerformanceTracking(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改运动员管理-现追踪";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["performanceTrackingRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updatePerformanceTracking(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addPerformanceTracking(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除运动员管理-现追踪编号为"' + _ids + '"的数据项？').then(function() {
    return delPerformanceTracking(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('athletes/performanceTracking/export', {
    ...queryParams.value
  }, `performanceTracking_${new Date().getTime()}.xlsx`)
}

getList();
</script>
