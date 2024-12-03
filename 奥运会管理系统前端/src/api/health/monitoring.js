import request from '@/utils/request'

// 查询健康监测列表
export function listMonitoring(query) {
  return request({
    url: '/health/monitoring/list',
    method: 'get',
    params: query
  })
}

// 查询健康监测详细
export function getMonitoring(id) {
  return request({
    url: '/health/monitoring/' + id,
    method: 'get'
  })
}

// 新增健康监测
export function addMonitoring(data) {
  return request({
    url: '/health/monitoring',
    method: 'post',
    data: data
  })
}

// 修改健康监测
export function updateMonitoring(data) {
  return request({
    url: '/health/monitoring',
    method: 'put',
    data: data
  })
}

// 删除健康监测
export function delMonitoring(id) {
  return request({
    url: '/health/monitoring/' + id,
    method: 'delete'
  })
}
