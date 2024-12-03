import request from '@/utils/request'

// 查询志愿者管理-培训管理列表
export function listTrainingManagement(query) {
  return request({
    url: '/volunteer/trainingManagement/list',
    method: 'get',
    params: query
  })
}

// 查询志愿者管理-培训管理详细
export function getTrainingManagement(id) {
  return request({
    url: '/volunteer/trainingManagement/' + id,
    method: 'get'
  })
}

// 新增志愿者管理-培训管理
export function addTrainingManagement(data) {
  return request({
    url: '/volunteer/trainingManagement',
    method: 'post',
    data: data
  })
}

// 修改志愿者管理-培训管理
export function updateTrainingManagement(data) {
  return request({
    url: '/volunteer/trainingManagement',
    method: 'put',
    data: data
  })
}

// 删除志愿者管理-培训管理
export function delTrainingManagement(id) {
  return request({
    url: '/volunteer/trainingManagement/' + id,
    method: 'delete'
  })
}
