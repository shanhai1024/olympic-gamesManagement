import request from '@/utils/request'

// 查询安全与健康协议-健康监测列表
export function listHealthyMonitoring(query) {
  return request({
    url: '/safeAndHealthy/healthyMonitoring/list',
    method: 'get',
    params: query
  })
}

// 查询安全与健康协议-健康监测详细
export function getHealthyMonitoring(id) {
  return request({
    url: '/safeAndHealthy/healthyMonitoring/' + id,
    method: 'get'
  })
}

// 新增安全与健康协议-健康监测
export function addHealthyMonitoring(data) {
  return request({
    url: '/safeAndHealthy/healthyMonitoring',
    method: 'post',
    data: data
  })
}

// 修改安全与健康协议-健康监测
export function updateHealthyMonitoring(data) {
  return request({
    url: '/safeAndHealthy/healthyMonitoring',
    method: 'put',
    data: data
  })
}

// 删除安全与健康协议-健康监测
export function delHealthyMonitoring(id) {
  return request({
    url: '/safeAndHealthy/healthyMonitoring/' + id,
    method: 'delete'
  })
}
