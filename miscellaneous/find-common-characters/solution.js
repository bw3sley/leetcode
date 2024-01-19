/**
 * @param {string[]} words
 * @return {string[]}
*/

function commonChars(words) {
    function countChars(word) {
        const count = new Array(26).fill(0);

        for (let char of word) {
            count[char.charCodeAt(0) - "a".charCodeAt(0)]++;
        }

        return count;
    }

    let minFrequency = countChars(words[0]);

    for (let index = 1; index < words.length; index++) {
        const currentFrequency = countChars(words[index]);

        for (let _index = 0; _index < 26; _index++) {
            minFrequency[_index] = Math.min(minFrequency[_index], currentFrequency[_index]);
        }
    }

    const result = [];

    for (let index = 0; index < 26; index++) {
        while (minFrequency[index] > 0) {
            result.push(String.fromCharCode(index + "a".charCodeAt(0)));
        
            minFrequency[index]--;
        }
    }

    return result;
}