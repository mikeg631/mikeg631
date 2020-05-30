public class HuffTree implements Comparable {
  private HuffBaseNode root;  

  /** Constructors */
  HuffTree(char el, int wt)
    { root = new HuffLeafNode(el, wt); }
  HuffTree(HuffBaseNode l, HuffBaseNode r, int wt)
    { root = new HuffInternalNode(l, r, wt); }

  HuffBaseNode root() { return root; }
  int weight() // Weight of tree is weight of root
    { return root.weight(); }
  public int compareTo(Object t) {
    HuffTree that = (HuffTree)t;
    if (root.weight() < that.weight()) return -1;
    else if (root.weight() == that.weight()) return 0;
    else return 1;
  }
}

class HuffInternalNode implements HuffBaseNode {
  private int weight;            
  private HuffBaseNode left;  
  private HuffBaseNode right; 
  private char character;

  /** Constructor */
  HuffInternalNode(HuffBaseNode l,
                          HuffBaseNode r, int wt)
    { left = l; right = r; weight = wt; }

  /** @return The left child */
  HuffBaseNode left() { return left; }

  /** @return The right child */
  HuffBaseNode right() { return right; }

  /** @return The weight */
  public int weight() { return weight; };
  

  /** Return false */
  public boolean isLeaf() { return false; }
}

class HuffLeafNode implements HuffBaseNode {
  private char element;      // Element for this node
  private int weight;        // Weight for this node

  /** Constructor */
  HuffLeafNode(char el, int wt)
    { element = el; weight = wt; }

  /** @return The element value */
  char value() { return element; }

  /** @return The weight */
  public int weight() { return weight; }
  

  /** Return true */
  public boolean isLeaf() { return true; }
}

interface HuffBaseNode {
  public boolean isLeaf(); 
  public int weight();
}
