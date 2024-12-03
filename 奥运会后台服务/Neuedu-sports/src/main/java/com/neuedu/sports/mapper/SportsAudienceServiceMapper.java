package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsAudienceService;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 门票与观众服务-观众服务Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsAudienceServiceMapper extends BaseMapper<SportsAudienceService>
{
    /**
     * 查询门票与观众服务-观众服务
     * 
     * @param id 门票与观众服务-观众服务主键
     * @return 门票与观众服务-观众服务
     */
    public SportsAudienceService selectSportsAudienceServiceById(Long id);

    /**
     * 查询门票与观众服务-观众服务列表
     * 
     * @param sportsAudienceService 门票与观众服务-观众服务
     * @return 门票与观众服务-观众服务集合
     */
    public List<SportsAudienceService> selectSportsAudienceServiceList(SportsAudienceService sportsAudienceService);

    /**
     * 新增门票与观众服务-观众服务
     * 
     * @param sportsAudienceService 门票与观众服务-观众服务
     * @return 结果
     */
    public int insertSportsAudienceService(SportsAudienceService sportsAudienceService);

    /**
     * 修改门票与观众服务-观众服务
     * 
     * @param sportsAudienceService 门票与观众服务-观众服务
     * @return 结果
     */
    public int updateSportsAudienceService(SportsAudienceService sportsAudienceService);

    /**
     * 删除门票与观众服务-观众服务
     * 
     * @param id 门票与观众服务-观众服务主键
     * @return 结果
     */
    public int deleteSportsAudienceServiceById(Long id);

    /**
     * 批量删除门票与观众服务-观众服务
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAudienceServiceByIds(Long[] ids);
}
