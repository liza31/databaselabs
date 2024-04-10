from bplustree import BPlusTree, IndexedKey
from alpha_hasher import AlphaHasher
from tabulate import tabulate


order = 4

bplustree = BPlusTree(
    order,
    idx_direct=IndexedKey.get_idx_direct(AlphaHasher()),
    idx_reverse=IndexedKey.idx_reverse
)

bplustree["Петренко"] = "+380501234567"
bplustree["Ковальчук"] = "+380501234568"
bplustree["Шевченко"] = "+380501234569"
bplustree["Мельник"] = "+380501234570"
bplustree["Козлов"] = "+380501234571"
bplustree["Іванова"] = "+380501234572"
bplustree["Григоренко"] = "+380501234573"
bplustree["Ткаченко"] = "+380501234574"
bplustree["Сидоренко"] = "+380501234575"
bplustree["Павленко"] = "+380501234576"
bplustree["Бондаренко"] = "+380501234577"

print(bplustree["Іванова"])

print(
    tabulate(
        rows=[
            {'Name': pair[0], 'Phone': pair[1]}
            for pair in bplustree.between(
                start_key="Бондаренко",
                end_key="Сидоренко"
            )
        ]
    )
)


del bplustree["Петренко"]
del bplustree["Козлов"]
del bplustree["Ковальчук"]
del bplustree["Григоренко"]
del bplustree["Мельник"]
del bplustree["Шевченко"]
del bplustree["Іванова"]

print(bplustree["Іванова"])

print(
    tabulate(
        rows=[
            {'Name': pair[0], 'Phone': pair[1]}
            for pair in bplustree.between(
                start_key="Бондаренко",
                end_key="Сидоренко"
            )
        ]
    )
)
