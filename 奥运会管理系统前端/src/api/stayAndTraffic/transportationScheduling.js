import request from '@/utils/request'

// 查询住宿与交通调度-交通调度列表
export function listTransportationScheduling(query) {
  return request({
    url: '/stayAndTraffic/transportationScheduling/list',
    method: 'get',
    params: query
  })
}

// 查询住宿与交通调度-交通调度详细
export function getTransportationScheduling(id) {
  return request({
    url: '/stayAndTraffic/transportationScheduling/' + id,
    method: 'get'
  })
}

// 新增住宿与交通调度-交通调度
export function addTransportationScheduling(data) {
  return request({
    url: '/stayAndTraffic/transportationScheduling',
    method: 'post',
    data: data
  })
}

// 修改住宿与交通调度-交通调度
export function updateTransportationScheduling(data) {
  return request({
    url: '/stayAndTraffic/transportationScheduling',
    method: 'put',
    data: data
  })
}

// 删除住宿与交通调度-交通调度
export function delTransportationScheduling(id) {
  return request({
    url: '/stayAndTraffic/transportationScheduling/' + id,
    method: 'delete'
  })
}
