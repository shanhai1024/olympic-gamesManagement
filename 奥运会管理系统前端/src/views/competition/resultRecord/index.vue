<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="比赛" prop="matchId">
        <el-select v-model="queryParams.matchId" clearable style="width: 200px">
            <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
        </el-select>
      </el-form-item>
      <el-form-item label="获胜运动员" prop="winnerAthleteId" label-width="120px">
        <el-select v-model="queryParams.winnerAthleteId" clearable style="width: 200px">
            <el-option v-for="item in athelteNameList" :key="item.value" :value="item.value" :label="item.label" />
        </el-select>
      </el-form-item>
<!--      <el-form-item label="失败运动员ID" prop="loserAthleteId">-->
<!--        <el-input-->
<!--          v-model="queryParams.loserAthleteId"-->
<!--          placeholder="请输入失败运动员ID"-->
<!--          clearable-->
<!--          @keyup.enter="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="比赛结果" prop="result">-->
<!--        <el-input-->
<!--          v-model="queryParams.result"-->
<!--          placeholder="请输入比赛结果"-->
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
          v-hasPermi="['competition:resultRecord:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['competition:resultRecord:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['competition:resultRecord:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['competition:resultRecord:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="resultRecordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="jie" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="比赛" align="center" prop="matchId" :formatter="handleMatchName" />
      <el-table-column label="获胜运动员" align="center" prop="winnerAthleteId" :formatter="handleWinnerName" />
      <el-table-column label="失败运动员" align="center" prop="loserAthleteId" :formatter="handleLoserName"/>
      <el-table-column label="比赛结果" align="center" prop="result" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['competition:resultRecord:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['competition:resultRecord:remove']">删除</el-button>
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

    <!-- 添加或修改赛事管理-结果记录对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="resultRecordRef" :model="form" :rules="rules" label-width="100px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="比赛" prop="matchId">
            <el-select v-model="form.matchId" clearable style="width: 200px">
                <el-option v-for="item in eventNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="获胜运动员" prop="winnerAthleteId" >
            <el-select v-model="form.winnerAthleteId" clearable style="width: 200px">
                <el-option v-for="item in athelteNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="失败运动员" prop="loserAthleteId" >
            <el-select v-model="loserId" multiple clearable style="width: 200px">
                <el-option v-for="item in athelteNameList" :key="item.value" :value="item.value" :label="item.label" />
            </el-select>
        </el-form-item>
        <el-form-item label="比赛结果" prop="result">
          <el-input v-model="form.result" placeholder="请输入比赛结果" />
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

<script setup name="ResultRecord">
import { listResultRecord, getResultRecord, delResultRecord, addResultRecord, updateResultRecord } from "@/api/competition/resultRecord";

const { proxy } = getCurrentInstance();

const resultRecordList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const loserId = ref([])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    matchId: null,
    winnerAthleteId: null,
    loserAthleteId: null,
    result: null
  },
  rules: {
  }
});
const eventNameList = ref([])
proxy.getQuerySelect("query_eventName").then(res=>{
    eventNameList.value = res.data
})

const athelteNameList = ref([])
proxy.getQuerySelect("query_athelteName").then(res=>{
    athelteNameList.value = res.data
})
const { queryParams, form, rules } = toRefs(data);

function handleMatchName(row){
    for (let valueElement of eventNameList.value) {
        if(valueElement.value == row.matchId){
            return valueElement.label
        }
    }
    return ""
}

function handleWinnerName(row){
    for (let valueElement of athelteNameList.value) {
        if(valueElement.value == row.winnerAthleteId){
            return valueElement.label
        }
    }
    return ""
}

function handleLoserName(row){
    let arr = []
    console.log(row.loserAthleteId)
    for (let valueElement of athelteNameList.value) {
        if(row.loserAthleteId.split(",").map(Number).includes(valueElement.value)){
            arr.push(valueElement.label)
        }
    }
    return arr.join(",")
}

/** 查询赛事管理-结果记录列表 */
function getList() {
  loading.value = true;
  listResultRecord(queryParams.value).then(response => {
    
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
    jie: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null,
    matchId: null,
    winnerAthleteId: null,
    loserAthleteId: null,
    result: null
  };
  proxy.resetForm("resultRecordRef");
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
  ids.value = selection.map(item => item.jie);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加赛事管理-结果记录";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _jie = row.jie || ids.value
  getResultRecord(_jie).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改赛事管理-结果记录";
    loserId.value = form.value.loserAthleteId?.split(",").map(Number)
      // loserId.value.push(1)
  });
}

/** 提交按钮 */
function submitForm() {
    if(loserId.value != null)
        form.value.loserAthleteId = loserId.value.toString()
  proxy.$refs["resultRecordRef"].validate(valid => {
    if (valid) {
      if (form.value.jie != null) {
        updateResultRecord(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          loserId.value = []
          getList();
        });
      } else {
        addResultRecord(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          loserId.value = []
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _jies = row.jie || ids.value;
  proxy.$modal.confirm('是否确认删除赛事管理-结果记录编号为"' + _jies + '"的数据项？').then(function() {
    return delResultRecord(_jies);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('competition/resultRecord/export', {
    ...queryParams.value
  }, `resultRecord_${new Date().getTime()}.xlsx`)
}

getList();
</script>
