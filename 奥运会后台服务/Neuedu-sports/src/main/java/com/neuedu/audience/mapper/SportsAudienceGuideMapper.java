package com.neuedu.audience.mapper;

import java.util.List;
import com.neuedu.audience.domain.SportsAudienceGuide;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 观众指南Mapper接口
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Mapper
public interface SportsAudienceGuideMapper extends BaseMapper<SportsAudienceGuide>
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
     * 删除观众指南
     * 
     * @param id 观众指南主键
     * @return 结果
     */
    public int deleteSportsAudienceGuideById(Long id);

    /**
     * 批量删除观众指南
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAudienceGuideByIds(Long[] ids);
}
