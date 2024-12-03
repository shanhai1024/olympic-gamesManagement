<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="规则生效日期" prop="ruleEffectDate">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.ruleEffectDate"-->
<!--          type="date"-->
<!--          value-format="YYYY-MM-DD"-->
<!--          placeholder="请选择规则生效日期">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="Refresh" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['competition:ruleUpdate:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['competition:ruleUpdate:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['competition:ruleUpdate:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['competition:ruleUpdate:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ruleUpdateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="规则内容" align="center" prop="ruleContent" />
      <el-table-column label="规则生效日期" align="center" prop="ruleEffectDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.ruleEffectDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['competition:ruleUpdate:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['competition:ruleUpdate:remove']">删除</el-button>
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

    <!-- 添加或修改赛事管理-规则更新对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="ruleUpdateRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="规则内容">
          <el-input v-model="form.ruleContent" type="textarea" />
        </el-form-item>
        <el-form-item label="规则生效日期" prop="ruleEffectDate" label-width="100px">
          <el-date-picker clearable
            v-model="form.ruleEffectDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择规则生效日期">
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

<script setup name="RuleUpdate">
import { listRuleUpdate, getRuleUpdate, delRuleUpdate, addRuleUpdate, updateRuleUpdate } from "@/api/competition/ruleUpdate";

const { proxy } = getCurrentInstance();

const ruleUpdateList = ref([]);
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
    ruleContent: null,
    ruleEffectDate: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询赛事管理-规则更新列表 */
function getList() {
  loading.value = true;
  listRuleUpdate(queryParams.value).then(response => {
    ruleUpdateList.value = response.rows;
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
    ruleContent: null,
    ruleEffectDate: null
  };
  proxy.resetForm("ruleUpdateRef");
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
  title.value = "添加赛事管理-规则更新";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getRuleUpdate(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改赛事管理-规则更新";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["ruleUpdateRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateRuleUpdate(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addRuleUpdate(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除赛事管理-规则更新编号为"' + _ids + '"的数据项？').then(function() {
    return delRuleUpdate(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('competition/ruleUpdate/export', {
    ...queryParams.value
  }, `ruleUpdate_${new Date().getTime()}.xlsx`)
}

getList();
</script>
