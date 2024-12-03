import request from '@/utils/request'

// 查询住宿安排列表
export function listArrangement(query) {
  return request({
    url: '/accommodation/arrangement/list',
    method: 'get',
    params: query
  })
}

// 查询住宿安排详细
export function getArrangement(id) {
  return request({
    url: '/accommodation/arrangement/' + id,
    method: 'get'
  })
}

// 新增住宿安排
export function addArrangement(data) {
  return request({
    url: '/accommodation/arrangement',
    method: 'post',
    data: data
  })
}

// 修改住宿安排
export function updateArrangement(data) {
  return request({
    url: '/accommodation/arrangement',
    method: 'put',
    data: data
  })
}

// 删除住宿安排
export function delArrangement(id) {
  return request({
    url: '/accommodation/arrangement/' + id,
    method: 'delete'
  })
}
