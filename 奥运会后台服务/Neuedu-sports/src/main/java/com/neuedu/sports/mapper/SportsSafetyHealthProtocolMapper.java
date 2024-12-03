package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsSafetyHealthProtocol;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 安全与健康协议Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsSafetyHealthProtocolMapper extends BaseMapper<SportsSafetyHealthProtocol>
{
    /**
     * 查询安全与健康协议
     * 
     * @param id 安全与健康协议主键
     * @return 安全与健康协议
     */
    public SportsSafetyHealthProtocol selectSportsSafetyHealthProtocolById(Long id);

    /**
     * 查询安全与健康协议列表
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 安全与健康协议集合
     */
    public List<SportsSafetyHealthProtocol> selectSportsSafetyHealthProtocolList(SportsSafetyHealthProtocol sportsSafetyHealthProtocol);

    /**
     * 新增安全与健康协议
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 结果
     */
    public int insertSportsSafetyHealthProtocol(SportsSafetyHealthProtocol sportsSafetyHealthProtocol);

    /**
     * 修改安全与健康协议
     * 
     * @param sportsSafetyHealthProtocol 安全与健康协议
     * @return 结果
     */
    public int updateSportsSafetyHealthProtocol(SportsSafetyHealthProtocol sportsSafetyHealthProtocol);

    /**
     * 删除安全与健康协议
     * 
     * @param id 安全与健康协议主键
     * @return 结果
     */
    public int deleteSportsSafetyHealthProtocolById(Long id);

    /**
     * 批量删除安全与健康协议
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsSafetyHealthProtocolByIds(Long[] ids);
}
