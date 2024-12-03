package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsPressReleaseMapper;
import com.neuedu.sports.domain.SportsPressRelease;
import com.neuedu.sports.service.ISportsPressReleaseService;

/**
 * 媒体与公关-新闻发布Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsPressReleaseServiceImpl extends ServiceImpl<SportsPressReleaseMapper, SportsPressRelease> implements ISportsPressReleaseService
{
    private final SportsPressReleaseMapper sportsPressReleaseMapper;

    /**
     * 查询媒体与公关-新闻发布
     * 
     * @param id 媒体与公关-新闻发布主键
     * @return 媒体与公关-新闻发布
     */
    @Override
    public SportsPressRelease selectSportsPressReleaseById(Long id)
    {
        return sportsPressReleaseMapper.selectSportsPressReleaseById(id);
    }

    /**
     * 查询媒体与公关-新闻发布列表
     * 
     * @param sportsPressRelease 媒体与公关-新闻发布
     * @return 媒体与公关-新闻发布
     */
    @Override
    public List<SportsPressRelease> selectSportsPressReleaseList(SportsPressRelease sportsPressRelease)
    {
        return sportsPressReleaseMapper.selectSportsPressReleaseList(sportsPressRelease);
    }

    /**
     * 新增媒体与公关-新闻发布
     * 
     * @param sportsPressRelease 媒体与公关-新闻发布
     * @return 结果
     */
    @Override
    public int insertSportsPressRelease(SportsPressRelease sportsPressRelease)
    {
        sportsPressRelease.setCreateTime(DateUtils.getNowDate());
        return sportsPressReleaseMapper.insertSportsPressRelease(sportsPressRelease);
    }

    /**
     * 修改媒体与公关-新闻发布
     * 
     * @param sportsPressRelease 媒体与公关-新闻发布
     * @return 结果
     */
    @Override
    public int updateSportsPressRelease(SportsPressRelease sportsPressRelease)
    {
        sportsPressRelease.setUpdateTime(DateUtils.getNowDate());
        return sportsPressReleaseMapper.updateSportsPressRelease(sportsPressRelease);
    }

    /**
     * 批量删除媒体与公关-新闻发布
     * 
     * @param ids 需要删除的媒体与公关-新闻发布主键
     * @return 结果
     */
    @Override
    public int deleteSportsPressReleaseByIds(Long[] ids)
    {
        return sportsPressReleaseMapper.deleteSportsPressReleaseByIds(ids);
    }

    /**
     * 删除媒体与公关-新闻发布信息
     * 
     * @param id 媒体与公关-新闻发布主键
     * @return 结果
     */
    @Override
    public int deleteSportsPressReleaseById(Long id)
    {
        return sportsPressReleaseMapper.deleteSportsPressReleaseById(id);
    }
}
