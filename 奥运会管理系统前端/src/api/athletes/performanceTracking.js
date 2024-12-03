import request from '@/utils/request'

// 查询运动员管理-现追踪列表
export function listPerformanceTracking(query) {
  return request({
    url: '/athletes/performanceTracking/list',
    method: 'get',
    params: query
  })
}

// 查询运动员管理-现追踪详细
export function getPerformanceTracking(id) {
  return request({
    url: '/athletes/performanceTracking/' + id,
    method: 'get'
  })
}

// 新增运动员管理-现追踪
export function addPerformanceTracking(data) {
  return request({
    url: '/athletes/performanceTracking',
    method: 'post',
    data: data
  })
}

// 修改运动员管理-现追踪
export function updatePerformanceTracking(data) {
  return request({
    url: '/athletes/performanceTracking',
    method: 'put',
    data: data
  })
}

// 删除运动员管理-现追踪
export function delPerformanceTracking(id) {
  return request({
    url: '/athletes/performanceTracking/' + id,
    method: 'delete'
  })
}
