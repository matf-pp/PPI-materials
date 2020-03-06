# Hip (red sa prioritetom)
# https://docs.python.org/3.7/library/heapq.html
# Funkcije:
# * heapify – Konvertuje listu u hip u mestu.
# * heappush – Dodaje element u hip.
# * heappop – Vraca koren hipa.
# * heapreplace – Zamenjuje koren hipa novom vrednoscu prosledjenoj funckiji.
import heapq

H = [21,1,45,78,3,5]
heapq.heapify(H)
print(H)
heapq.heappush(H,8)
print(H)

# Heapsort
def heapsort(iterable):
    h = []
    for value in iterable:
        heapq.heappush(h, value)
    return [heapq.heappop(h) for i in range(len(h))]
print(heapsort([1, 3, 5, 7, 9, 2, 4, 6, 8, 0]))