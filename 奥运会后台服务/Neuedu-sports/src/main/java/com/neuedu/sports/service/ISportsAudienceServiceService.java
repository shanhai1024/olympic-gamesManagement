package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsAudienceService;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 门票与观众服务-观众服务Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsAudienceServiceService extends IService<SportsAudienceService>
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
     * 批量删除门票与观众服务-观众服务
     * 
     * @param ids 需要删除的门票与观众服务-观众服务主键集合
     * @return 结果
     */
    public int deleteSportsAudienceServiceByIds(Long[] ids);

    /**
     * 删除门票与观众服务-观众服务信息
     * 
     * @param id 门票与观众服务-观众服务主键
     * @return 结果
     */
    public int deleteSportsAudienceServiceById(Long id);
}
