import random


def sort(arr):
    items = arr[:]
    length = len(items)
    for i in range(length - 1):
        for j in range(i + 1, length):
            if items[i] > items[j]:
                items[i], items[j] = items[j], items[i]
    return items


def rnd(count):
    arr = []
    for _ in range(count):
        rnd = random.randint(1, 100)
        arr.append(rnd)
    return arr


def main():
    unsort_list = rnd(10)
    print('orgin: ', unsort_list)
    sorted_list = sort(unsort_list)
    print('sorted:', sorted_list)


if __name__ == '__main__':
    main()
