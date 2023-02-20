#include <stdlib.h>
#include <stdio.h>

/**
 * A node of the binary tree containing the node's integer value
 * and pointers to its right and left children (or null).
 */
struct Node {
  struct Node* left;
  struct Node* right;
  struct Node* parent;
  int value;
};

/**
 * Create a new node with no children.
 */
struct Node* create (int value) {
  struct Node* ret = (struct Node*)malloc(sizeof(struct Node));
  ret->left=NULL;
  ret->right=NULL;
  ret->parent=NULL;
  ret->value=100;
  return ret;
}

/**
 * Insert the node n into the binary tree rooted by toNode.
 */
void insert (struct Node* toNode, struct Node* n) {
  // TODO
}

/**
 * Print the contents entire binary tree in order of ascending integer value.
 */
void printInOrder (struct Node* node) {
  if (node->left != NULL){
    printInOrder(node->left);
  }
  printf("%d\n", node->value);
  if (node->right != NULL){
    printInOrder(node->right);
  }
}

/**
 * Print path of values from root to specified node in orderer starting from root.
 * Each node in path indicates direction taken (i.e., left or right) from parent to arive at node.
 */
void printPath (struct Node* node) {
  // TODO
}

/**
 * Create a new tree populated with values provided on the command line and
 * print it in depth-first order.
 */
int main (int argc, char* argv[]) {
  struct Node* root = 0;
  // read values from command line and add them to the tree
  struct Node* lastNodeInserted = NULL;
  for (int i=1; i<argc; i++) {
    int value = atoi (argv [i]);
    struct Node* node = create (value);
    if (i==1)
      root = node;
    else
      insert (root, node);
    lastNodeInserted = node;
  }
  // print results
  if (root) {
    printf("In Order:\n");
    printInOrder (root);
    printf("Path to %d:\n", 0);  // TODO: replace 0 with expression that gets value of lastNodeInserted
    printPath(lastNodeInserted);
  }
}