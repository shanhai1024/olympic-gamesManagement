package com.neuedu.audience.service;

import java.util.List;
import com.neuedu.audience.domain.SportsAudienceGuide;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 观众指南Service接口
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
public interface ISportsAudienceGuideService extends IService<SportsAudienceGuide>
{
    /**
     * 查询观众指南
     * 
     * @param id 观众指南主键
     * @return 观众指南
     */
    public SportsAudienceGuide selectSportsAudienceGuideById(Long id);

    /**
     * 查询观众指南列表
     * 
     * @param sportsAudienceGuide 观众指南
     * @return 观众指南集合
     */
    public List<SportsAudienceGuide> selectSportsAudienceGuideList(SportsAudienceGuide sportsAudienceGuide);

    /**
     * 新增观众指南
     * 
     * @param sportsAudienceGuide 观众指南
     * @return 结果
     */
    public int insertSportsAudienceGuide(SportsAudienceGuide sportsAudienceGuide);

    /**
     * 修改观众指南
     * 
     * @param sportsAudienceGuide 观众指南
     * @return 结果
     */
    public int updateSportsAudienceGuide(SportsAudienceGuide sportsAudienceGuide);

    /**
     * 批量删除观众指南
     * 
     * @param ids 需要删除的观众指南主键集合
     * @return 结果
     */
    public int deleteSportsAudienceGuideByIds(Long[] ids);

    /**
     * 删除观众指南信息
     * 
     * @param id 观众指南主键
     * @return 结果
     */
    public int deleteSportsAudienceGuideById(Long id);
}
