import request from '@/utils/request'

// 查询住宿与交通调度-住宿安排列表
export function listAccommodationArrangement(query) {
  return request({
    url: '/stayAndTraffic/accommodationArrangement/list',
    method: 'get',
    params: query
  })
}

// 查询住宿与交通调度-住宿安排详细
export function getAccommodationArrangement(id) {
  return request({
    url: '/stayAndTraffic/accommodationArrangement/' + id,
    method: 'get'
  })
}

// 新增住宿与交通调度-住宿安排
export function addAccommodationArrangement(data) {
  return request({
    url: '/stayAndTraffic/accommodationArrangement',
    method: 'post',
    data: data
  })
}

// 修改住宿与交通调度-住宿安排
export function updateAccommodationArrangement(data) {
  return request({
    url: '/stayAndTraffic/accommodationArrangement',
    method: 'put',
    data: data
  })
}

// 删除住宿与交通调度-住宿安排
export function delAccommodationArrangement(id) {
  return request({
    url: '/stayAndTraffic/accommodationArrangement/' + id,
    method: 'delete'
  })
}
