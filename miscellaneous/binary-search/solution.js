/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
*/

// O(n)

function search(nums, target) {
    return nums.findIndex(num => num === target);
}

// O (log n)

function search(nums, target) {
    let left = 0, right = nums.length - 1;

    while (left <= right) {
        const mid = Math.floor((left + right) / 2);

        if (nums[mid] === target) {
            return mid; // Econtrou o target, retorna o índice
        }

        else if (nums[mid] < target) {
            left = mid + 1; // O target está na metade direita
        }

        else {
            right = mid - 1; // O target está na metade esquerda
        }
    }

    return -1;
}