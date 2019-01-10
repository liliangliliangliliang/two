package dao;

import pojo.Member;
import pojo.Page;

import java.util.List;

public interface MemMapper {

    //分页查询所有
    Page<Member> menQueryPage( int pageNumber, int pageSize);
    //查询所有
    List<Member> menQuery();
    //单个查询
    Member menqueryById(String id);
    //模糊查询
    Member menqueryOne(String name);
    //修改
    int menUpdata(Member men);
    //删除
    int menDel(String id);
}
