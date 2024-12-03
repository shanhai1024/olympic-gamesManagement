package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsPressRelease;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 媒体与公关-新闻发布Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsPressReleaseService extends IService<SportsPressRelease>
{
    /**
     * 查询媒体与公关-新闻发布
     * 
     * @param id 媒体与公关-新闻发布主键
     * @return 媒体与公关-新闻发布
     */
    public SportsPressRelease selectSportsPressReleaseById(Long id);

    /**
     * 查询媒体与公关-新闻发布列表
     * 
     * @param sportsPressRelease 媒体与公关-新闻发布
     * @return 媒体与公关-新闻发布集合
     */
    public List<SportsPressRelease> selectSportsPressReleaseList(SportsPressRelease sportsPressRelease);

    /**
     * 新增媒体与公关-新闻发布
     * 
     * @param sportsPressRelease 媒体与公关-新闻发布
     * @return 结果
     */
    public int insertSportsPressRelease(SportsPressRelease sportsPressRelease);

    /**
     * 修改媒体与公关-新闻发布
     * 
     * @param sportsPressRelease 媒体与公关-新闻发布
     * @return 结果
     */
    public int updateSportsPressRelease(SportsPressRelease sportsPressRelease);

    /**
     * 批量删除媒体与公关-新闻发布
     * 
     * @param ids 需要删除的媒体与公关-新闻发布主键集合
     * @return 结果
     */
    public int deleteSportsPressReleaseByIds(Long[] ids);

    /**
     * 删除媒体与公关-新闻发布信息
     * 
     * @param id 媒体与公关-新闻发布主键
     * @return 结果
     */
    public int deleteSportsPressReleaseById(Long id);
}
