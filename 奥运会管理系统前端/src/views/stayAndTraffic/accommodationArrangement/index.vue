<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="人员类型" prop="personType">
        <el-select v-model="queryParams.personType" placeholder="请选择人员类型" clearable style="width: 200px">
          <el-option
            v-for="dict in person_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="住宿名称" prop="accommodationName">
        <el-input
          v-model="queryParams.accommodationName"
          placeholder="请输入住宿名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="住宿地址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入住宿地址"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间数量" prop="numberOfRooms">
        <el-input
          v-model="queryParams.numberOfRooms"
          placeholder="请输入房间数量"
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
          v-hasPermi="['accommodation:arrangement:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['accommodation:arrangement:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['accommodation:arrangement:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['accommodation:arrangement:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="arrangementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="人员类型" align="center" prop="personType">
        <template #default="scope">
          <dict-tag :options="person_type" :value="scope.row.personType"/>
        </template>
      </el-table-column>
      <el-table-column label="住宿名称" align="center" prop="accommodationName" />
      <el-table-column label="住宿地址" align="center" prop="address" />
      <el-table-column label="入住时间" align="center" prop="checkInDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.checkInDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="退房时间" align="center" prop="checkOutDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.checkOutDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房间数量" align="center" prop="numberOfRooms" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['accommodation:arrangement:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['accommodation:arrangement:remove']">删除</el-button>
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

    <!-- 添加或修改住宿安排对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="arrangementRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="人员类型" prop="personType">
          <el-select v-model="form.personType" placeholder="请选择人员类型" style="width: 200px">
            <el-option
              v-for="dict in person_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="住宿名称" prop="accommodationName">
          <el-input v-model="form.accommodationName" placeholder="请输入住宿名称" />
        </el-form-item>
        <el-form-item label="住宿地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入住宿地址" />
        </el-form-item>
        <el-form-item label="入住时间" prop="checkInDate">
          <el-date-picker clearable
            v-model="form.checkInDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择入住时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="退房时间" prop="checkOutDate">
          <el-date-picker clearable
            v-model="form.checkOutDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择退房时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="房间数量" prop="numberOfRooms">
          <el-input v-model="form.numberOfRooms" placeholder="请输入房间数量" />
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

<script setup name="Arrangement">
import { listArrangement, getArrangement, delArrangement, addArrangement, updateArrangement } from "@/api/accommodation/arrangement";

const { proxy } = getCurrentInstance();
const { person_type } = proxy.useDict('person_type');

const arrangementList = ref([]);
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
    personType: null,
    accommodationName: null,
    address: null,
    numberOfRooms: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询住宿安排列表 */
function getList() {
  loading.value = true;
  listArrangement(queryParams.value).then(response => {
    arrangementList.value = response.rows;
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
    personType: null,
    accommodationName: null,
    address: null,
    checkInDate: null,
    checkOutDate: null,
    numberOfRooms: null
  };
  proxy.resetForm("arrangementRef");
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
  title.value = "添加住宿安排";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getArrangement(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改住宿安排";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["arrangementRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateArrangement(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addArrangement(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除住宿安排编号为"' + _ids + '"的数据项？').then(function() {
    return delArrangement(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('accommodation/arrangement/export', {
    ...queryParams.value
  }, `arrangement_${new Date().getTime()}.xlsx`)
}

getList();
</script>
