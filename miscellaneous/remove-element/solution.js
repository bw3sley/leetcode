/**
 * @param {number[]} nums
 * @return {number}
*/

function removeElement(nums, val) {
    let counter = 0;

    for (const num of nums) {
        if (num !== val) {
            nums[counter++] = num;
        }
    }

    return counter++;
}