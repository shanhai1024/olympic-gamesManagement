import request from '@/utils/request'

// 查询志愿者管理-申请与审批列表
export function listApplicationApproval(query) {
  return request({
    url: '/volunteer/applicationApproval/list',
    method: 'get',
    params: query
  })
}

// 查询志愿者管理-申请与审批详细
export function getApplicationApproval(id) {
  return request({
    url: '/volunteer/applicationApproval/' + id,
    method: 'get'
  })
}

// 新增志愿者管理-申请与审批
export function addApplicationApproval(data) {
  return request({
    url: '/volunteer/applicationApproval',
    method: 'post',
    data: data
  })
}

// 修改志愿者管理-申请与审批
export function updateApplicationApproval(data) {
  return request({
    url: '/volunteer/applicationApproval',
    method: 'put',
    data: data
  })
}

// 删除志愿者管理-申请与审批
export function delApplicationApproval(id) {
  return request({
    url: '/volunteer/applicationApproval/' + id,
    method: 'delete'
  })
}
