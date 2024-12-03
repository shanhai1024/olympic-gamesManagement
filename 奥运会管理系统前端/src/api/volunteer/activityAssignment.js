import request from '@/utils/request'

// 查询志愿者管理-活动分配列表
export function listActivityAssignment(query) {
  return request({
    url: '/volunteer/activityAssignment/list',
    method: 'get',
    params: query
  })
}

// 查询志愿者管理-活动分配详细
export function getActivityAssignment(zho) {
  return request({
    url: '/volunteer/activityAssignment/' + zho,
    method: 'get'
  })
}

// 新增志愿者管理-活动分配
export function addActivityAssignment(data) {
  return request({
    url: '/volunteer/activityAssignment',
    method: 'post',
    data: data
  })
}

// 修改志愿者管理-活动分配
export function updateActivityAssignment(data) {
  return request({
    url: '/volunteer/activityAssignment',
    method: 'put',
    data: data
  })
}

// 删除志愿者管理-活动分配
export function delActivityAssignment(zho) {
  return request({
    url: '/volunteer/activityAssignment/' + zho,
    method: 'delete'
  })
}
