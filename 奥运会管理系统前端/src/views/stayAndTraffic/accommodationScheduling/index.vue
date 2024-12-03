<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="住宿类型" prop="accommodationType">
        <el-select v-model="queryParams.accommodationType" style="width: 200px" clearable>
            <el-option v-for="item in accommodation_type" :key="item.value" :value="item.value" :label="item.label" />
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
          v-hasPermi="['stayAndTraffic:accommodationScheduling:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['stayAndTraffic:accommodationScheduling:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['stayAndTraffic:accommodationScheduling:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="Download"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['stayAndTraffic:accommodationScheduling:export']"-->
<!--        >导出</el-button>-->
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="accommodationSchedulingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
        <el-table-column label="住宿类型" align="center" prop="accommodationType">
            <template #default="scope">
                <dict-tag :options="accommodation_type" :value="scope.row.accommodationType" />
            </template>
        </el-table-column>
      <el-table-column label="住宿详情" align="center" prop="accommodationDetails" />
      <el-table-column label="房间数量" align="center" prop="numberOfRooms" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['stayAndTraffic:accommodationScheduling:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['stayAndTraffic:accommodationScheduling:remove']">删除</el-button>
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

    <!-- 添加或修改住宿与交通调度-住宿调度对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="accommodationSchedulingRef" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
        <el-form-item label="住宿类型" prop="accommodationType">
          <el-select v-model="form.accommodationType"
            placeholder="请选择住宿类型"

             style="width: 200px"
          >
            <el-option v-for="item in accommodation_type" :key="item.value"
              :label="item.label" :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="住宿详情" prop="accommodationDetails">
          <el-input v-model="form.accommodationDetails" type="textarea" placeholder="请输入内容" />
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

<script setup name="AccommodationScheduling">
import { listAccommodationScheduling, getAccommodationScheduling, delAccommodationScheduling, addAccommodationScheduling, updateAccommodationScheduling } from "@/api/stayAndTraffic/accommodationScheduling";
import DictTag from "@/components/DictTag/index.vue";

const { proxy } = getCurrentInstance();

const accommodationSchedulingList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const { accommodation_type } = proxy.useDict("accommodation_type")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    accommodationType: null,
    accommodationDetails: null,
    numberOfRooms: null
  },
  rules: {
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询住宿与交通调度-住宿调度列表 */
function getList() {
  loading.value = true;
  listAccommodationScheduling(queryParams.value).then(response => {
    accommodationSchedulingList.value = response.rows;
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
    accommodationType: null,
    accommodationDetails: null,
    numberOfRooms: null
  };
  proxy.resetForm("accommodationSchedulingRef");
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
  title.value = "添加住宿与交通调度-住宿调度";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value
  getAccommodationScheduling(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改住宿与交通调度-住宿调度";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["accommodationSchedulingRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateAccommodationScheduling(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addAccommodationScheduling(form.value).then(response => {
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
  proxy.$modal.confirm('是否确认删除住宿与交通调度-住宿调度编号为"' + _ids + '"的数据项？').then(function() {
    return delAccommodationScheduling(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}



/** 导出按钮操作 */
function handleExport() {
  proxy.download('stayAndTraffic/accommodationScheduling/export', {
    ...queryParams.value
  }, `accommodationScheduling_${new Date().getTime()}.xlsx`)
}

getList();
</script>
