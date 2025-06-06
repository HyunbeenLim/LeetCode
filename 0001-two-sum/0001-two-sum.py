class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        sorted_lst = sorted(nums)
        ans = []
        s = 0
        e = len(nums) - 1

        while s < e:
            cur = sorted_lst[s] + sorted_lst[e]
            if cur == target:
                ans.append(nums.index(sorted_lst[s]))
                if sorted_lst[s] == sorted_lst[e]:
                    nums.pop(nums.index(sorted_lst[s]))
                    ans.append(nums.index(sorted_lst[e])+1)
                else:
                    ans.append(nums.index(sorted_lst[e]))
                return ans
            elif cur > target:
                e -= 1
            else:
                s += 1
        