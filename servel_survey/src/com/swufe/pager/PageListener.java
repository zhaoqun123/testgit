package com.swufe.pager;
 

import java.util.List;

public interface PageListener
{
  List<?>  doSelect(int recordStart, int sizePage, PageConfig pageConfig);

  int getCount(PageConfig pageConfig);
}