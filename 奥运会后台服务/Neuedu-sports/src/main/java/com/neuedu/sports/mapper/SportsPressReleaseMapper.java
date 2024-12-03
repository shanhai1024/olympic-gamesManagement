package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsPressRelease;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 媒体与公关-新闻发布Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsPressReleaseMapper extends BaseMapper<SportsPressRelease>
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
     * 删除媒体与公关-新闻发布
     * 
     * @param id 媒体与公关-新闻发布主键
     * @return 结果
     */
    public int deleteSportsPressReleaseById(Long id);

    /**
     * 批量删除媒体与公关-新闻发布
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsPressReleaseByIds(Long[] ids);
}
