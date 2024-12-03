import request from '@/utils/request'

// 查询媒体与公关-品牌合作列表
export function listBrandCooperation(query) {
  return request({
    url: '/mediaAndPublic/brandCooperation/list',
    method: 'get',
    params: query
  })
}

// 查询媒体与公关-品牌合作详细
export function getBrandCooperation(id) {
  return request({
    url: '/mediaAndPublic/brandCooperation/' + id,
    method: 'get'
  })
}

// 新增媒体与公关-品牌合作
export function addBrandCooperation(data) {
  return request({
    url: '/mediaAndPublic/brandCooperation',
    method: 'post',
    data: data
  })
}

// 修改媒体与公关-品牌合作
export function updateBrandCooperation(data) {
  return request({
    url: '/mediaAndPublic/brandCooperation',
    method: 'put',
    data: data
  })
}

// 删除媒体与公关-品牌合作
export function delBrandCooperation(id) {
  return request({
    url: '/mediaAndPublic/brandCooperation/' + id,
    method: 'delete'
  })
}
