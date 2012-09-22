from xlrd import open_workbook, cellname
from xlutils.copy import copy
from xpinyin import Pinyin

rb = open_workbook('hanzi.xls') 
rs = rb.sheet_by_index(0)
wb = copy(rb)
ws = wb.get_sheet(0)
p = Pinyin()
for x in range(rs.nrows):
    hanzi= rs.cell(x, 0).value
    pinyin = p.get_pinyin(hanzi) 
    ws.write(x, 1, pinyin)

wb.save('pinyin.xls')
raw_input("press any key to exit")
