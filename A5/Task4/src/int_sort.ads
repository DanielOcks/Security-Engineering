with Parallel_Sort;

package Int_Sort is new Parallel_Sort(Item_Type => Integer, "=" => "=", "<" => "<");