import request from '@/utils/request'

// 查询住宿与交通调度-观众导航列表
export function listAudienceNavigation(query) {
  return request({
    url: '/stayAndTraffic/audienceNavigation/list',
    method: 'get',
    params: query
  })
}

// 查询住宿与交通调度-观众导航详细
export function getAudienceNavigation(id) {
  return request({
    url: '/stayAndTraffic/audienceNavigation/' + id,
    method: 'get'
  })
}

// 新增住宿与交通调度-观众导航
export function addAudienceNavigation(data) {
  return request({
    url: '/stayAndTraffic/audienceNavigation',
    method: 'post',
    data: data
  })
}

// 修改住宿与交通调度-观众导航
export function updateAudienceNavigation(data) {
  return request({
    url: '/stayAndTraffic/audienceNavigation',
    method: 'put',
    data: data
  })
}

// 删除住宿与交通调度-观众导航
export function delAudienceNavigation(id) {
  return request({
    url: '/stayAndTraffic/audienceNavigation/' + id,
    method: 'delete'
  })
}
