<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="运动员姓名" prop="athleteName" label-width="100px">
        <el-input
          v-model="queryParams.athleteName"
          placeholder="请输入运动员姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="athleteGender">
        <el-select v-model="queryParams.athleteGender" style="width: 200px;">
            <el-option v-for="item in sys_user_sex" :key="item.value" :value="item.value" :label="item.label" />
        </el-select>
      </el-form-item>
      <el-form-item label="国籍" prop="athleteNationality">
        <el-input
          v-model="queryParams.athleteNationality"
          placeholder="请输入国籍"
          clearable
          @keyup.enter="handleQuery"
        />
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
          v-hasPermi="['athletes:athletesPersonalInfo:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['athletes:athletesPersonalInfo:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['athletes:athletesPersonalInfo:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['athletes:athletesPersonalInfo:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="athletesPersonalInfoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="运动员姓名" align="center" prop="athleteName" />
      <el-table-column label="性别" align="center" prop="athleteGender">
          <template #default="scope">
              <dict-tag :options="sys_user_sex" :value="scope.row.athleteGender" />
          </template>
      </el-table-column>
      <el-table-column label="年龄" align="center" prop="athleteAge" />
      <el-table-column label="身高" align="center" prop="athleteHeight" />
      <el-table-column label="体重" align="center" prop="athleteWeight" />
      <el-table-column label="国籍" align="center" prop="athleteNationality" />
      <el-table-column label="成绩历史" align="center" prop="performanceHistory" />
      <el-table-column label="健康状况" align="center" prop="healthStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['athletes:athletesPersonalInfo:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['athletes:athletesPersonalInfo:remove']">删除</el-button>
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

    <!-- 添加或修改运动员管理-个人信息管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="athletesPersonalInfoRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="运动员姓名" prop="athleteName">
          <el-input v-model="form.athleteName" placeholder="请输入运动员姓名" />
        </el-form-item>
          <el-form-item label="性别" prop="athleteGender">
              <el-select v-model="form.athleteGender" style="width: 200px;">
                  <el-option v-for="item in sys_user_sex" :key="item.value" :value="item.value" :label="item.label" />
              </el-select>
          </el-form-item>
        <el-form-item label="年龄" prop="athleteAge">
          <el-input v-model="form.athleteAge" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="身高" prop="athleteHeight">
          <el-input v-model="form.athleteHeight" placeholder="请输入身高" />
        </el-form-item>
        <el-form-item label="体重" prop="athleteWeight">
          <el-input v-model="form.athleteWeight" placeholder="请输入体重" />
        </el-form-item>
        <el-form-item label="国籍" prop="athleteNationality">
          <el-input v-model="form.athleteNationality" placeholder="请输入国籍" />
        </el-form-item>
        <el-form-item label="成绩历史" prop="performanceHistory">
          <el-input v-model="form.performanceHistory" type="textarea" placeholder="请输入内容" />
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

<script setup name="AthletesPersonalInfo">
import { listAthletesPersonalInfo, getAthletesPersonalInfo, delAthletesPersonalInfo, addAthletesPersonalInfo, updateAthletesPersonalInfo } from "@/api/athletes/athletesPersonalInfo";
import DictTag from "@/components/DictTag/index.vue";

const { proxy } = getCurrentInstance();

const athletesPersonalInfoList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const { sys_user_sex } = proxy.useDict("sys_user_sex")
console.log(sys_user_sex)

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    athleteName: null,
    athleteGender: null,
    athleteAge: null,
    athleteHeight: null,
    athleteWeight: null,
    athleteNationality: null,
    performanceHistory: null,
    healthStatus: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询运动员管理-个人信息管理列表 */
function getList() {
  loading.value = true;
  listAthletesPersonalInfo(queryParams.value).then(response => {
    
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
    athleteName: null,
    athleteGender: null,
    athleteAge: null,
    athleteHeight: null,
    athleteWeight: null,
    athleteNationality: null,
    performanceHistory: null,
    healthStatus: null
  };
  proxy.resetForm("athletesPersonalInfoRef");
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
  title.value = "添加运动员管理-个人信息管理";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getAthletesPersonalInfo(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改运动员管理-个人信息管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["athletesPersonalInfoRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateAthletesPersonalInfo(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addAthletesPersonalInfo(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除运动员管理-个人信息管理编号为"' + _ids + '"的数据项？').then(function() {
    return delAthletesPersonalInfo(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('athletes/athletesPersonalInfo/export', {
    ...queryParams.value
  }, `athletesPersonalInfo_${new Date().getTime()}.xlsx`)
}

getList();
</script>
