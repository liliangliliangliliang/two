package pojo;

import java.util.List;

/**
 * @ClassName pojo.Page
 * @Author LILIANG
 * @Date 2018/12/20 15:29
 * @Version 1.0
 **/
public class Page<T> {
    //每页显示条数
    private int pageSize;
    //当前页码数
    private int pageNumber;
    //总条数
    private int totalRecode;
    //当前页数据
    private List<T> pageData;

    public Page() {
    }

    public Page(int pageSize, int pageNumber, int totalRecode, List<T> pageData) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
        this.totalRecode = totalRecode;
        this.pageData = pageData;
    }

    //总页码
    public int getTotalPage(){
        int totalPage=totalRecode %pageSize ==0?totalRecode /pageSize:totalRecode /pageSize+1;
        return totalPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getTotalRecode() {
        return totalRecode;
    }

    public void setTotalRecode(int totalRecode) {
        this.totalRecode = totalRecode;
    }

    public List<T> getPageData() {
        return pageData;
    }

    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageSize=" + pageSize +
                ", pageNumber=" + pageNumber +
                ", totalRecode=" + totalRecode +
                ", pageData=" + pageData +
                '}';
    }
}
