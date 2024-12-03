package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsTransportationScheduling;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 住宿与交通调度-交通调度Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsTransportationSchedulingMapper extends BaseMapper<SportsTransportationScheduling>
{
    /**
     * 查询住宿与交通调度-交通调度
     * 
     * @param id 住宿与交通调度-交通调度主键
     * @return 住宿与交通调度-交通调度
     */
    public SportsTransportationScheduling selectSportsTransportationSchedulingById(Long id);

    /**
     * 查询住宿与交通调度-交通调度列表
     * 
     * @param sportsTransportationScheduling 住宿与交通调度-交通调度
     * @return 住宿与交通调度-交通调度集合
     */
    public List<SportsTransportationScheduling> selectSportsTransportationSchedulingList(SportsTransportationScheduling sportsTransportationScheduling);

    /**
     * 新增住宿与交通调度-交通调度
     * 
     * @param sportsTransportationScheduling 住宿与交通调度-交通调度
     * @return 结果
     */
    public int insertSportsTransportationScheduling(SportsTransportationScheduling sportsTransportationScheduling);

    /**
     * 修改住宿与交通调度-交通调度
     * 
     * @param sportsTransportationScheduling 住宿与交通调度-交通调度
     * @return 结果
     */
    public int updateSportsTransportationScheduling(SportsTransportationScheduling sportsTransportationScheduling);

    /**
     * 删除住宿与交通调度-交通调度
     * 
     * @param id 住宿与交通调度-交通调度主键
     * @return 结果
     */
    public int deleteSportsTransportationSchedulingById(Long id);

    /**
     * 批量删除住宿与交通调度-交通调度
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsTransportationSchedulingByIds(Long[] ids);
}
