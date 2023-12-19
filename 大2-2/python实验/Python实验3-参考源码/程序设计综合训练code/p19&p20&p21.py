from scipy.sparse import csgraph
import subprocess

from scipy import sparse
if __name__ == '__main__':
    a = sparse.dok_matrix((10, 5))
    a[2, 3] = 1.0
    a[3, 3] = 2.0
    a[4, 3] = 3.0
    print(a.keys())
    print(a.values())

    b = sparse.lil_matrix((10, 5))
    b[2, 3] = 1.0
    b[3, 4] = 2.0
    b[3, 2] = 3.0
    print(b.data)
    print(b.rows)

    print("====================================")
    row = [2, 3, 3, 2]
    col = [3, 4, 2, 3]
    data = [1, 2, 3, 10]
    c = sparse.coo_matrix((data, (row, col)), shape=(5, 6))
    print(c.col, c.row, c.data)
    print(c.toarray())
    print("====================================")

    # Find the shortest path
    # Define the graph in the DOT language
    code = """
    digraph graph1{
        rankdir=LR;
        size="8,5"
        node [shape = circle];
        A -> B [ label = "10" ];
        B -> C [ label = "5" ];
        A -> C [ label = "3" ];
        C -> D [ label = "7" ];
        D -> A [ label = "4" ];
        D -> C [ label = "6" ];
    }
    """

    # Define the command and its arguments to run Graphviz
    dot_args = ["dot", "-T", "svg"]

    # Run Graphviz and pass the DOT code as input
    p = subprocess.Popen(dot_args, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = p.communicate(code.encode('utf-8'))

    # Save the SVG image to a file
    with open("output.svg", "w") as f:
        f.write(stdout.decode("utf-8"))

    w = sparse.dok_matrix((4,4))
    edges = [(0, 1, 10), (1, 2, 5), (0, 2, 3),
             (2, 3, 7), (3, 0, 4), (3, 2, 6)]

    for i, j, v in edges:
        w[i, j] = v
    d, p = csgraph.dijkstra(csgraph=w, directed=True, indices=0, return_predecessors=True)

    print(d)
    print(p)