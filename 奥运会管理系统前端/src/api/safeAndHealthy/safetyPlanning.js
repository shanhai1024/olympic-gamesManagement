import request from '@/utils/request'

// 查询安全与健康协议-安全规划列表
export function listSafetyPlanning(query) {
  return request({
    url: '/safeAndHealthy/safetyPlanning/list',
    method: 'get',
    params: query
  })
}

// 查询安全与健康协议-安全规划详细
export function getSafetyPlanning(id) {
  return request({
    url: '/safeAndHealthy/safetyPlanning/' + id,
    method: 'get'
  })
}

// 新增安全与健康协议-安全规划
export function addSafetyPlanning(data) {
  return request({
    url: '/safeAndHealthy/safetyPlanning',
    method: 'post',
    data: data
  })
}

// 修改安全与健康协议-安全规划
export function updateSafetyPlanning(data) {
  return request({
    url: '/safeAndHealthy/safetyPlanning',
    method: 'put',
    data: data
  })
}

// 删除安全与健康协议-安全规划
export function delSafetyPlanning(id) {
  return request({
    url: '/safeAndHealthy/safetyPlanning/' + id,
    method: 'delete'
  })
}
