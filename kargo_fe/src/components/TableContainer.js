import {
  useTable,
  useFilters,
  useGlobalFilter,
  useSortBy,
  usePagination,
} from "react-table";

import { Button, Form, Table } from "react-bootstrap";
import { TableFilter } from "./TableFilter";
import {
  FaSortDown,
  FaSortUp,
  FaSort,
  FaPlus,
  FaChevronLeft,
  FaChevronRight,
} from "react-icons/fa";
import React from "react";

export function TableContainer({
  columns,
  data,
  title,
  rowProps = () => ({}),
}) {
  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    prepareRow,
    page, // Instead of using 'rows', we'll use page,
    // which has only the rows for the active page

    // The rest of these things are super handy, too ;)
    canPreviousPage,
    canNextPage,
    pageOptions,
    // pageCount,
    // gotoPage,
    nextPage,
    previousPage,
    setPageSize,

    state,
    preGlobalFilteredRows,
    setGlobalFilter,
  } = useTable(
    {
      columns,
      data,
    },
    useFilters,
    useGlobalFilter,
    useSortBy,
    usePagination
  );

  return (
    <>
      {/* FILTER */}
      <div className="d-flex flex-row justify-content-between mb-3">
        <Button variant="success" href={`/${title}/add`}>
          <FaPlus className="mr-2" />
          Add {title}
        </Button>
        <TableFilter
          preGlobalFilteredRows={preGlobalFilteredRows}
          globalFilter={state.globalFilter}
          setGlobalFilter={setGlobalFilter}
        />
      </div>

      {/* TABLE */}
      <Table striped bordered hover {...getTableProps()}>
        <thead>
          {headerGroups.map((headerGroup) => (
            <tr {...headerGroup.getHeaderGroupProps()}>
              {headerGroup.headers.map((column) => (
                <th
                  scope="col"
                  {...column.getHeaderProps(column.getSortByToggleProps())}
                >
                  <div className="d-flex justify-content-between">
                    {column.render("Header")}
                    {/* Add a sort direction indicator */}
                    {column.disableSortBy ? (
                      ""
                    ) : (
                      <span>
                        {column.isSorted ? (
                          column.isSortedDesc ? (
                            <FaSortDown />
                          ) : (
                            <FaSortUp />
                          )
                        ) : (
                          <FaSort />
                        )}
                      </span>
                    )}
                  </div>
                </th>
              ))}
            </tr>
          ))}
        </thead>

        <tbody {...getTableBodyProps()} className="bg-white">
          {page.map((row, i) => {
            prepareRow(row);
            return (
              <tr {...row.getRowProps(rowProps(row))}>
                {row.cells.map((cell) => {
                  // console.log(cell);
                  return (
                    <td
                      {...cell.getCellProps()}
                      className="px-6 py-4 whitespace-nowrap"
                      role="cell"
                    >
                      {cell.column.Cell.name === "defaultRenderer" ? (
                        <div>{cell.render("Cell")}</div>
                      ) : (
                        cell.render("Cell")
                      )}
                    </td>
                  );
                })}
              </tr>
            );
          })}
        </tbody>
      </Table>

      {/* Pagination */}
      <div className="py-3 d-flex items-center justify-content-between">
        <div className="flex-1 flex justify-content-between">
          <Button
            variant="outline-light"
            className="btn-w-120 text-dark"
            onClick={() => previousPage()}
            disabled={!canPreviousPage}
          >
            <FaChevronLeft /> Previous
          </Button>
          <Button
            variant="outline-light"
            className="btn-w-120 text-dark"
            onClick={() => nextPage()}
            disabled={!canNextPage}
          >
            Next
            <FaChevronRight />
          </Button>
        </div>

        <div className="flex-1">
          <div className="">
            <span className="mr-2">
              Page <span className="font-medium">{state.pageIndex + 1}</span> of{" "}
              <span className="font-medium">{pageOptions.length}</span>
            </span>
            <label>
              {/* <span className="sr-only">Items Per Page</span> */}
              <Form.Group>
                {/* <Form.Label>Example select</Form.Label> */}
                <Form.Control
                  as="select"
                  className="mb-0"
                  value={state.pageSize}
                  onChange={(e) => {
                    setPageSize(Number(e.target.value));
                  }}
                >
                  {[5, 10, 20].map((pageSize) => (
                    <option key={pageSize} value={pageSize}>
                      Show {pageSize}
                    </option>
                  ))}
                </Form.Control>
              </Form.Group>
            </label>
          </div>

          {/* <div>
            <nav
              className="relative z-0 inline-flex rounded-md shadow-sm -space-x-px"
              aria-label="Pagination"
            >
              <a
                className="btn btn-outline-danger btn-floating m-1"
                onClick={() => gotoPage(0)}
                disabled={!canPreviousPage}
                role="button"
              >
                <span>First</span>
              </a>
            </nav>
          </div> */}
        </div>
      </div>
    </>
  );
}
