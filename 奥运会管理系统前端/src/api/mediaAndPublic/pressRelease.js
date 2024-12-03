import request from '@/utils/request'

// 查询媒体与公关-新闻发布列表
export function listPressRelease(query) {
  return request({
    url: '/mediaAndPublic/pressRelease/list',
    method: 'get',
    params: query
  })
}

// 查询媒体与公关-新闻发布详细
export function getPressRelease(id) {
  return request({
    url: '/mediaAndPublic/pressRelease/' + id,
    method: 'get'
  })
}

// 新增媒体与公关-新闻发布
export function addPressRelease(data) {
  return request({
    url: '/mediaAndPublic/pressRelease',
    method: 'post',
    data: data
  })
}

// 修改媒体与公关-新闻发布
export function updatePressRelease(data) {
  return request({
    url: '/mediaAndPublic/pressRelease',
    method: 'put',
    data: data
  })
}

// 删除媒体与公关-新闻发布
export function delPressRelease(id) {
  return request({
    url: '/mediaAndPublic/pressRelease/' + id,
    method: 'delete'
  })
}
