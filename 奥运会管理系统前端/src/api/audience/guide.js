import request from '@/utils/request'

// 查询观众指南列表
export function listGuide(query) {
  return request({
    url: '/audience/guide/list',
    method: 'get',
    params: query
  })
}

// 查询观众指南详细
export function getGuide(id) {
  return request({
    url: '/audience/guide/' + id,
    method: 'get'
  })
}

// 新增观众指南
export function addGuide(data) {
  return request({
    url: '/audience/guide',
    method: 'post',
    data: data
  })
}

// 修改观众指南
export function updateGuide(data) {
  return request({
    url: '/audience/guide',
    method: 'put',
    data: data
  })
}

// 删除观众指南
export function delGuide(id) {
  return request({
    url: '/audience/guide/' + id,
    method: 'delete'
  })
}
