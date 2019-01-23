import sys

class BigNumber:
    def __init__(self, number):
        self.v = str(number)[::-1]

    def value(self):
        return(self.v[::-1])

    def add(self, elem):
        elemstr = elem.v
        if(len(elemstr) < len(self.v)):
            sum = self.iterateAdd(self.v, elemstr)
        else:
            sum = self.iterateAdd(elemstr, self.v)
        return(BigNumber(sum[::-1]))

    def iterateAdd(self, bg, sm):
        if(bg == '9' and sm == '1'):
            return('01')
        sum = ""
        r = 0
        bg_a, bg_b = bg[:len(sm)], bg[len(sm):]
        for i in range(len(sm)):
            sum_i = int(bg_a[i]) + int(sm[i]) + r
            if(sum_i >=10):
                sum_i = sum_i - 10
                r = 1
            else:
                r = 0
            sum += str(sum_i)
        if(r == 1):
            bg_b = self.iterateAdd(bg_b, str(r))
        sum += bg_b
        return(sum)

big_a = BigNumber(sys.argv[1])
big_b = BigNumber(sys.argv[2])

print(big_a.value())
print(big_b.value())

big_c = big_a.add(big_b)
print(big_c.value())
