package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsTransportationService;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 住宿与交通调度-交通服务Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsTransportationServiceService extends IService<SportsTransportationService>
{
    /**
     * 查询住宿与交通调度-交通服务
     * 
     * @param id 住宿与交通调度-交通服务主键
     * @return 住宿与交通调度-交通服务
     */
    public SportsTransportationService selectSportsTransportationServiceById(Long id);

    /**
     * 查询住宿与交通调度-交通服务列表
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 住宿与交通调度-交通服务集合
     */
    public List<SportsTransportationService> selectSportsTransportationServiceList(SportsTransportationService sportsTransportationService);

    /**
     * 新增住宿与交通调度-交通服务
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 结果
     */
    public int insertSportsTransportationService(SportsTransportationService sportsTransportationService);

    /**
     * 修改住宿与交通调度-交通服务
     * 
     * @param sportsTransportationService 住宿与交通调度-交通服务
     * @return 结果
     */
    public int updateSportsTransportationService(SportsTransportationService sportsTransportationService);

    /**
     * 批量删除住宿与交通调度-交通服务
     * 
     * @param ids 需要删除的住宿与交通调度-交通服务主键集合
     * @return 结果
     */
    public int deleteSportsTransportationServiceByIds(Long[] ids);

    /**
     * 删除住宿与交通调度-交通服务信息
     * 
     * @param id 住宿与交通调度-交通服务主键
     * @return 结果
     */
    public int deleteSportsTransportationServiceById(Long id);
}
